require 'spec_helper'

describe WorkCard do
  
  let(:start_time){Time.parse("2014-02-20 08:15:00")}
  let(:end_time){Time.parse("2014-02-20 08:31:00")}

  it "should not raise an error on initialize without argument" do
    expect { subject }.to_not raise_error
  end

  describe "#total_time" do
    subject {WorkCard.new(start_at: start_time, end_at: end_time)}
    it "should give total time that was worked" do
      time=subject.total_time
      expect(time).to eq(60*16)
    end
  end
end
