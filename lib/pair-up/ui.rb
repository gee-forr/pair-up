HighLine.track_eof = false

module PairUp
  class UI

    def self.prompt_for_pair(new_participant)
      highline.say("I don't know who #{new_participant} is.")
      if highline.agree("Do you want to add #{new_participant} to ~/.pair-up_pairs? (yn)")
        participant_name = highline.ask("What is #{new_participant}'s full name?").to_s
        participant_email = highline.ask("What is #{new_participant}'s email?").to_s
        PairUp::Participant.add(new_participant, participant_email, participant_name)
        PairUp::Participant.write_file
        return new_participant
      else
        highline.say("Ignoring #{new_participant}.")
      end
      return nil
    end

    private

    def self.highline
      @highline ||= HighLine.new
    end

  end
end
