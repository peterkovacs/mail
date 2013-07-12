# encoding: utf-8
require 'spec_helper'

describe Mail::ReceivedField do

  it "should initialize" do
    doing { Mail::ReceivedField.new("Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)") }.should_not raise_error
  end

  it "should be able to tell the time" do
    Mail::ReceivedField.new("Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)").date_time.class.should == DateTime
  end

  it "should accept a string with the field name" do
    t = Mail::ReceivedField.new('Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    t.name.should == 'Received'
    t.value.should == 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
    t.info.should == 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>'
    t.date_time.should == ::DateTime.parse('10 May 2005 17:26:50 +0000 (GMT)')
  end
  
  it "should accept a string without the field name" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    t.name.should == 'Received'
    t.value.should == 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
    t.info.should == 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>'
    t.date_time.should == ::DateTime.parse('10 May 2005 17:26:50 +0000 (GMT)')
  end

  it "should provide an encoded value" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    t.encoded.should == "Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000\r\n"
  end

  it "should provide an encoded value with correct timezone" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 -0500 (EST)')
    t.encoded.should == "Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 -0500\r\n"
  end

  it "should provide an decoded value" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    t.decoded.should == 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000'
  end
  
  it "should handle a blank value" do
    t = Mail::ReceivedField.new('')
    t.decoded.should == ''
    t.encoded.should == "Received: \r\n"
  end

  it "should handle elements without date" do
    t = Mail::ReceivedField.new('from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)')
    t.decoded.should == 'from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)'
    t.encoded.should == "Received: from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)\r\n"
  end

  it "should handle elements without info" do
    t = Mail::ReceivedField.new( '(qmail 77527 invoked by uid 89); 10 Jun 2004 12:17:55 -0000' )
    t.decoded.should == '(qmail 77527 invoked by uid 89); Thu, 10 Jun 2004 12:17:55 +0000' 
    t.encoded.should == "Received: (qmail 77527 invoked by uid 89); Thu, 10 Jun 2004 12:17:55 +0000\r\n"
  end
  
end
