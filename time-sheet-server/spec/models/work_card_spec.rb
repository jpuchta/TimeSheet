require 'spec_helper'



def check_work_card_fields work_card, start_at, end_at, pause
  expect(work_card.start_at).to eq(start_at)
  expect(work_card.end_at).to eq(end_at)
  expect(work_card.pause).to eq(pause)
end


describe WorkCard do
  
  let(:start_time){Time.parse("2014-02-20 08:15:00")}
  let(:end_time){Time.parse("2014-02-20 08:31:00")}
  let(:pause){Time.at(60)}



  describe "#initialize" do

  	describe "initialization without arguments" do
      it "should not raise an error on initialize without arguments" do
        expect { subject }.to_not raise_error
      end
      it "should set all fields to default values" do
        check_work_card_fields(subject,nil,nil,Time.at(0))
      end
    end

    describe "initialization with start_at argument" do
      subject {WorkCard.new(start_at: start_time)}
      it "should not raise an error on initialize with start_at argument" do
        expect { subject }.to_not raise_error
      end
      it "should set start_at to the argument and other fields to default values" do
        check_work_card_fields(subject,start_time,nil,Time.at(0))
      end
    end
=begin
    describe "initialization with only end_at argument" do
      subject {WorkCard.new(end_at: end_time)}
      it "should not be valid when initialized with only end_at argument" do
        subject.should_not be_valid
      end
    end
=end
    describe "initialization with all arguments" do
      subject { WorkCard.new(start_at: start_time, end_at: end_time, pause: pause)}
      it "should set start_at, end_at and pause to arguments" do
        expect(subject.start_at).to eq(start_time)
        expect(subject.end_at).to eq(end_time)
        expect(subject.pause).to eq(pause)
      end
    end

  end

  describe "validations" do
    
    it "should be valid for void arguments" do
      w = WorkCard.new
      expect(w).to be_valid
    end

    it "should not be valid for empty start_at ane nonempty any other argment" do
      w1 = WorkCard.new(end_at: end_time)
      w2 = WorkCard.new(pause: pause)
      w3 = WorkCard.new(end_at: end_time, pause: pause)

      expect(w1).to_not be_valid
      expect(w2).to_not be_valid
      expect(w3).to_not be_valid
    end

    it "should not be valid if end_at is before start_at" do
      w1 = WorkCard.new(start_at: end_time, end_at:start_time)
      w2 = WorkCard.new(start_at: end_time, end_at:start_time, pause:pause)

      expect(w1).to_not be_valid
      expect(w2).to_not be_valid
    end

    it "should not be valid if pause is greater then period betwen start and end" do
      w = WorkCard.new(start_at: start_time, end_at: end_time, pause: Time.at(end_time-start_time+1))
      expect(w).to_not be_valid
    end
  end

  describe "mutators" do
    describe "#set_start_at" do
      subject { WorkCard.new()}
      it "should change start_at" do
        subject.set_start_at(start_time)
        expect(subject.start_at).to eq(start_time)
      end
    end

    describe "#set_end_at" do
      subject { WorkCard.new() }
      it "should change end_at" do
        subject.set_end_at(end_time)
        expect(subject.end_at).to eq(end_time)
      end
      it "should not ommit validations" do
        subject.set_end_at(end_time)
        expect(subject).to_not be_valid
      end
    end

    describe "#set_pause" do
      subject { WorkCard.new() }
      it "should change pause" do
        subject.set_pause(Time.at(30))
        expect(subject.pause).to eq(Time.at(30))
      end
      it "should not ommit validations" do
        subject.set_pause(Time.at(10))
        expect(subject).to_not be_valid
      end
    end
  end

 
  describe "#total_time" do
    subject {WorkCard.new(start_at: start_time, end_at: end_time)}
    it "should give total time that was worked, in seconds" do
      time=subject.total_time
      expect(time).to eq(60*16)
    end
    it "should give total time that was worked, including pauses, in seconds" do
	    subject.pause=pause
      time=subject.total_time
      expect(time).to eq(60*15)
    end
  end



  describe "#start!" do
    describe "for work_card with empty start_at field" do
      before do
        Timecop.freeze(Time.now)
      end
      after do
        Timecop.return
      end
      subject {WorkCard.new()}
      it "should set the start_at field to Time.now" do
        t=Time.now()
        subject.start!
        expect(subject.start_at).to eq(t)
      end

      it "should not add annything to errors" do
        subject.start!
        expect(subject.errors.empty?).to eq(true)
      end

      it "should return a truthy value" do
        output = subject.start!
        expect(output).to be
      end
    end

    describe "for work_card with already set start_at field" do
      subject {WorkCard.new(start_at: start_time)}
      it "should not change the start_at field" do
        subject.start!
        expect(subject.start_at).to eq(start_time)
      end

      it "should set an errror 'Cannot start a WorkCard that was alredy started'" do
        subject.start!
        expect(subject.errors.full_messages).to eq(["Start! cannot start a WorkCard that was alredy started"])
      end

      it "should return a falsey value" do
        output = subject.start!
        expect(output).to_not be
      end
    end
  end

  describe "#end" do
    describe "for empty work_card" do
      subject {WorkCard.new()}
      it "should not change any fields of a work_card" do
        subject.finish
        check_work_card_fields(subject,nil,nil,Time.at(0))
      end
      it "should add add a note to errors" do
        subject.finish
        expect(subject.errors.full_messages).to eq(["End! cannot end a WorkCard that was not started"])
      end
      it "should return a falsey value" do
        output = subject.finish
        expect(output).to_not be
      end
    end

    describe "for a started work_card" do
      before do
        Timecop.freeze(Time.now)
      end
      after do
        Timecop.return
      end
      subject {WorkCard.new(start_at: start_time)}
      it "should set end_at to Time.now() and not change other fields" do
        t=Time.now()
        subject.finish
        check_work_card_fields(subject,start_time,t,Time.at(0))
#        expect(subject.end_at).to eq(t)
      end
      it "should not add annything to errors" do
        subject.finish
        expect(subject.errors).to be_empty
      end
      it "should return a truthy value" do
        output = subject.finish
        expect(output).to be
      end
    end

    describe "for ended work_card" do
      subject {WorkCard.new(start_at:start_time, end_at:end_time)}
      it "should not change any fields of a work_card" do
        subject.finish
        check_work_card_fields(subject,start_time,end_time,Time.at(0))
      end
      it "should add add a note to errors" do
        subject.finish
        expect(subject.errors.full_messages).to eq(["End! cannot end a WorkCard that was already ended"])
      end
      it "should return a falsey value" do
        output = subject.finish
        expect(output).to_not be
      end
    end

  end

#  describe "methods with !" do
 #   describe ".start!" do
  #  end
  #end

end
