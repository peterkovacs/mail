# encoding: utf-8
require 'spec_helper'

describe Mail::ReceivedField do

  it "should initialize" do
    expect { Mail::ReceivedField.new("Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)") }.not_to raise_error
  end

  it "should accept a string with the field name" do
    t = Mail::ReceivedField.new('Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    expect(t.name).to eq 'Received'
    expect(t.value).to eq 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
  end

  it "should accept a string with the field name" do
    t = Mail::ReceivedField.new('Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    expect(t.name).to eq 'Received'
    expect(t.value).to eq 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
  end
  
  it "should accept a string without the field name" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    expect(t.name).to eq 'Received'
    expect(t.value).to eq 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
  end

  it "should provide an encoded value" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    expect(t.encoded).to eq "Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix)\r\n with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000\r\n (GMT)\r\n"
  end

  it "should provide an encoded value with correct timezone" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 -0500 (EST)')
    expect(t.encoded).to eq "Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix)\r\n with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 -0500\r\n (EST)\r\n"
  end

  it "should provide an decoded value" do
    t = Mail::ReceivedField.new('from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)')
    expect(t.encoded).to eq "Received: from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix)\r\n with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000\r\n (GMT)\r\n"
  end

  it "should handle empty name-value lists with a comment only (qmail style)" do
    t = Mail::ReceivedField.new('(qmail 24365 invoked by uid 99); 25 Jan 2011 12:31:11 -0000')
    expect( t.to_s ).to eq '(qmail 24365 invoked by uid 99); 25 Jan 2011 12:31:11 -0000'
  end

  it "should handle a blank value" do
    t = Mail::ReceivedField.new('')
    expect(t.decoded).to eq nil
    expect(t.encoded).to eq "Received: \r\n"
  end

  it "should handle elements without date" do
    t = Mail::ReceivedField.new('from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)')
    expect(t.decoded).to eq 'from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)'
    expect(t.encoded).to eq "Received: from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with\r\n ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)\r\n"
  end

  it "should handle elements without info" do
    t = Mail::ReceivedField.new( '(qmail 77527 invoked by uid 89); 10 Jun 2004 12:17:55 -0000' )
    expect(t.decoded).to eq '(qmail 77527 invoked by uid 89); 10 Jun 2004 12:17:55 -0000' 
    expect(t.encoded).to eq "Received: (qmail 77527 invoked by uid 89); 10 Jun 2004 12:17:55 -0000\r\n"
  end
  
end
