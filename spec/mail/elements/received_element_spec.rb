require 'spec_helper'

describe Mail::ReceivedElement do

  it "should parse a date" do
    received_text  = 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
    doing { Mail::ReceivedElement.new(received_text) }.should_not raise_error
  end

  it "should raise an error if the input is useless" do
    received_text = nil
    doing { Mail::ReceivedElement.new(received_text) }.should raise_error
  end

  it "should raise an error if the input is useless" do
    received_text  = '""""""""""""""""'
    doing { Mail::ReceivedElement.new(received_text) }.should raise_error
  end
  
  it "should give back the date time" do
    received_text  = 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
    date_text = '10 May 2005 17:26:50 +0000 (GMT)'
    rec = Mail::ReceivedElement.new(received_text)
    rec.date_time.should == ::DateTime.parse(date_text)
  end
  
  it "should give back the info" do
    received_text  = 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>; Tue, 10 May 2005 17:26:50 +0000 (GMT)'
    info_text = 'from localhost (localhost [127.0.0.1]) by xxx.xxxxx.com (Postfix) with ESMTP id 50FD3A96F for <xxxx@xxxx.com>'
    rec = Mail::ReceivedElement.new(received_text)
    rec.info.should == info_text
  end

  it "should parse elements without date" do
    received_text = 'from smtp-in-1001.vdc.amazon.com by smtp-out-1001.amazon.com with ESMTP (peer crosscheck: smtp-in-1001.vdc.amazon.com)'
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == received_text
  end

  it "should parse comment element" do
    received_text = '(qmail 77527 invoked by uid 89); 10 Jun 2004 12:17:55 -0000'
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == '(qmail 77527 invoked by uid 89)' 
    rec.date_time.should == ::DateTime.parse( '10 Jun 2004 12:17:55 -0000' )
  end

  it "should parse element with comma" do
    received_text = "from 12.110.141.194 (helo=miner) by mrelay.perfora.net with ESMTP (Nemesis), id 1BYPIH-1MVx-0MKyxe-0004FJ; Thu, 10 Jun 2004 09:08:33 -0400"
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == 'from 12.110.141.194 (helo=miner) by mrelay.perfora.net with ESMTP (Nemesis), id 1BYPIH-1MVx-0MKyxe-0004FJ' 
    rec.date_time.should == ::DateTime.parse( 'Thu, 10 Jun 2004 09:08:33 -0400' )
  end

  it "should parse element with nospace" do
    received_text = "from 199.222.69.154 ([199.222.69.154]) by maint3.acm.org with Microsoft SMTPSVC(5.5.1877.197.19); Sun, 13 Jun 2004 20:52:40 -0400"
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == 'from 199.222.69.154 ([199.222.69.154]) by maint3.acm.org with Microsoft SMTPSVC(5.5.1877.197.19)' 
    rec.date_time.should == ::DateTime.parse( 'Sun, 13 Jun 2004 20:52:40 -0400' )
  end

  it "should parse element with malformed timezone" do
    received_text = "from cemail.ceweb.com (unverified [127.0.0.1]) by lists.catholicexchange.com (SurgeMail 1.3i) with ESMTP id 6639316 for <peter@xxxxxx>; Wed, 07 Jul 2004 23:08:05 -500"
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == 'from cemail.ceweb.com (unverified [127.0.0.1]) by lists.catholicexchange.com (SurgeMail 1.3i) with ESMTP id 6639316 for <peter@xxxxxx>' 
    rec.date_time.should == ::DateTime.parse( 'Wed, 07 Jul 2004 23:08:05 -500' )
  end

  it "should parse commas in atoms" do
    received_text = "by us-bdb-1201.vdc.amazon.com id AAA-default-12226,16; 12 Jul 2004 07:44:56 -0700"
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == 'by us-bdb-1201.vdc.amazon.com id AAA-default-12226,16' 
    rec.date_time.should == ::DateTime.parse( '12 Jul 2004 07:44:56 -0700' )
  end

  it "should parse semi-colon separators" do
    pending 'Probably will never get this to work.'
    received_text = "from 68.9.227.247 (SquirrelMail authenticated user mmueller); by webmail.cs.uri.edu with HTTP; Mon, 12 Jul 2004 21:58:15 -0400 (EDT)"
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == 'from 68.9.227.247 (SquirrelMail authenticated user mmueller); by webmail.cs.uri.edu with HTTP' 
    rec.date_time.should == ::DateTime.parse( 'Mon, 12 Jul 2004 21:58:15 -0400 (EDT)' )
  end

  it "should parse name_val_list after date" do
    received_text = "from localhost (localhost [127.0.0.1]) (uid 0) by stark with local; Thu, 27 Jan 2005 11:39:15 -0500 id 00018A65.41F91933.00003206"
    rec = Mail::ReceivedElement.new( received_text )
    rec.info.should == 'from localhost (localhost [127.0.0.1]) (uid 0) by stark with local' 
    rec.date_time.should == ::DateTime.parse( 'Thu, 27 Jan 2005 11:39:15 -0500' )
  end
  
end
