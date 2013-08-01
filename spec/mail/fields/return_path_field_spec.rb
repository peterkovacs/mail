require 'spec_helper'

describe Mail::ReturnPathField do
  it "should allow you to specify a field" do
    rp = Mail::ReturnPathField.new('Return-Path: mikel@test.lindsaar.net')
    rp.address.should eq 'mikel@test.lindsaar.net'
  end
  
  it "should encode the addr_spec in <>" do
    rp = Mail::ReturnPathField.new('Return-Path: mikel@test.lindsaar.net')
    rp.encoded.should eq "Return-Path: <mikel@test.lindsaar.net>\r\n"
  end

  it "should accept <>" do
    rp = Mail::ReturnPathField.new('<>')
    rp.encoded.should eq "Return-Path: <>\r\n"
  end
  
  it "should set the return path" do
    mail = Mail.new do
      to "to@someemail.com"
      from "from@someemail.com"
      subject "Can't set the return-path"
      return_path "bounce@someemail.com" 
      message_id "<1234@someemail.com>"
      body "body"
    end
    mail.return_path.should eq "bounce@someemail.com"
  end
  
  it "should set the return path" do
    mail = Mail.new do
      to "to@someemail.com"
      from "from@someemail.com"
      subject "Can't set the return-path"
      return_path "bounce@someemail.com" 
      message_id "<1234@someemail.com>"
      body "body"
    end
    encoded_mail = Mail.new(mail.encoded)
    encoded_mail.return_path.should eq "bounce@someemail.com"
  end
  
  it "should wrap the return path addr_spec in <>" do
    mail = Mail.new do
      to "to@someemail.com"
      from "from@someemail.com"
      subject "Can't set the return-path"
      return_path "bounce@someemail.com" 
      message_id "<1234@someemail.com>"
      body "body"
    end
    mail.encoded.should =~ /<bounce@someemail\.com>/
  end
  
  # This is widely seen in the wild, probably from some overzealous mailer wrapping the return-path in <>.
  it "should accept <angle_addr>" do
    rp = Mail::ReturnPathField.new( '<First Last <local@domain.com>>' )
    rp.address.should eq 'local@domain.com'
    rp.encoded.should eq "Return-Path: <local@domain.com>\r\n"
  end
  
end
