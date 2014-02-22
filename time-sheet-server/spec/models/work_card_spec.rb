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


 
  describe "#total_time" do
    subject {WorkCard.new(start_at: start_time, end_at: end_time)}
    it "should give total time that was worked, in seconds" do
      time=subject.total_time
      expect(time).to eq(60*16)
    end
#    it "should give total time that was worked, including pauses, in seconds" do
#	  subject {WorkCard.new(start_at: start_time, end_at: end_time, pause: pause)}
 #     time=subject.total_time
  #    expect(time).to eq(60*15)
   # end
  end
end
