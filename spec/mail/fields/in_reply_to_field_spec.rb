# encoding: utf-8
require 'spec_helper'
# 
#    The "In-Reply-To:" field will contain the contents of the "Message-
#    ID:" field of the message to which this one is a reply (the "parent
#    message").  If there is more than one parent message, then the "In-
#    Reply-To:" field will contain the contents of all of the parents'
#    "Message-ID:" fields.  If there is no "Message-ID:" field in any of
#    the parent messages, then the new message will have no "In-Reply-To:"
#    field.

describe Mail::InReplyToField do

  describe "initialization" do
    it "should initialize" do
      doing { Mail::InReplyToField.new("<1234@test.lindsaar.net>") }.should_not raise_error
    end

    it "should accept a string with the field name" do
      t = Mail::InReplyToField.new('In-Reply-To: <1234@test.lindsaar.net>')
      t.name.should eq 'In-Reply-To'
      t.value.should eq '<1234@test.lindsaar.net>'
      t.message_id.should eq '<1234@test.lindsaar.net>'
    end

    it "should accept a string without the field name" do
      t = Mail::InReplyToField.new('<1234@test.lindsaar.net>')
      t.name.should eq 'In-Reply-To'
      t.value.should eq '<1234@test.lindsaar.net>'
      t.message_id.should eq '<1234@test.lindsaar.net>'
    end
    
    it "should provide encoded" do
      t = Mail::InReplyToField.new('<1234@test.lindsaar.net>')
      t.encoded.should eq "In-Reply-To: <1234@test.lindsaar.net>\r\n"
    end
    
    it "should handle many encoded message IDs" do
      t = Mail::InReplyToField.new('<1234@test.lindsaar.net> <4567@test.lindsaar.net>')
      t.encoded.should eq "In-Reply-To: <1234@test.lindsaar.net>\r\n <4567@test.lindsaar.net>\r\n"
    end

    it "should handle an array of message IDs" do
      t = Mail::InReplyToField.new(['<1234@test.lindsaar.net>', '<4567@test.lindsaar.net>'])
      t.encoded.should eq "In-Reply-To: <1234@test.lindsaar.net>\r\n <4567@test.lindsaar.net>\r\n"
    end

    it "should provide decoded" do
      t = Mail::InReplyToField.new('<1234@test.lindsaar.net>')
      t.decoded.should eq "<1234@test.lindsaar.net>"
    end
    
    it "should handle many decoded message IDs" do
      t = Mail::InReplyToField.new('<1234@test.lindsaar.net> <4567@test.lindsaar.net>')
      t.decoded.should eq '<1234@test.lindsaar.net> <4567@test.lindsaar.net>'
    end
    
    it "should handle an empty value" do
      t = Mail::InReplyToField.new('')
      t.name.should eq 'In-Reply-To'
      t.decoded.should eq nil
    end
    
  end

  describe "handlign multiple message ids" do
    it "should handle many message IDs" do
      t = Mail::InReplyToField.new('<1234@test.lindsaar.net> <4567@test.lindsaar.net>')
      t.name.should eq 'In-Reply-To'
      t.message_ids.should eq ['<1234@test.lindsaar.net>', '<4567@test.lindsaar.net>']
    end
  end

  it "should output lines shorter than 998 chars" do
    k = Mail::InReplyToField.new('<Kohciuku@apholoVu.com> <foovohPu@Thegahsh.com> <UuseZeow@oocieBie.com> <UchaeKoo@eeJoukie.com> <ieKahque@ieGoochu.com> <aZaXaeva@ungaiGai.com> <sheiraiK@ookaiSha.com> <weijooPi@ahfuRaeh.com> <FiruJeur@weiphohP.com> <cuadoiQu@aiZuuqua.com> <YohGieVe@Reacepae.com> <Ieyechum@ephooGho.com> <uGhievoo@vusaeciM.com> <ouhieTha@leizaeTi.com> <ohgohGhu@jieNgooh.com> <ahNookah@oChiecoo.com> <taeWieTu@iuwiLooZ.com> <Kohraiji@AizohGoa.com> <hiQuaegh@eeluThii.com> <Uunaesoh@UogheeCh.com> <JeQuahMa@Thahchoh.com> <aaxohJoh@ahfaeCho.com> <Pahneehu@eehooChi.com> <angeoKah@Wahsaeme.com> <ietovoaV@muewaeZi.com> <aebiuZur@oteeYaiF.com> <pheiXahw@Muquahba.com> <aNgiaPha@bohliNge.com> <Eikawohf@IevaiQuu.com> <gihaeduZ@Raighiey.com> <Theequoh@hoamaeSa.com> <VeiVooyi@aimuQuoo.com> <ahGoocie@BohpheVi.com> <roivahPa@uPhoghai.com> <gioZohli@Gaochoow.com> <eireLair@phaevieR.com> <TahthaeC@oolaiBei.com> <phuYeika@leiKauPh.com> <BieYenoh@Xaebaalo.com> <xohvaeWa@ahghaeRe.com> <thoQuohV@Ubooheay.com> <pheeWohV@feicaeNg.com>')
    lines = k.encoded.split("\r\n\s")
    lines.each { |line| line.length.should < 998 }
  end

  describe "handling extra tokens" do
    # Seen from X-Mailer: ELM [version 2.5 PL6]
    it "should handle extra tokens" do
      t = Mail::InReplyToField.new( '<20050202135402.GT12263@xxxx> from "First Last" at Feb 02, 2005 08:54:02 AM' )
      t.name.should eq 'In-Reply-To'
      t.message_id.should eq '<20050202135402.GT12263@xxxx>'
    end

    it "should handle <20010307181747.A1531@socrate>; from address on date" do
      t = Mail::InReplyToField.new( '<20010307181747.A1531@socrate>; from xxx@yyy.com on Wed, Mar 07, 2001 at 06:17:47PM +0100' )
      t.name.should eq 'In-Reply-To'
      t.message_ids.should eq ['<20010307181747.A1531@socrate>']
    end

    it "should handle <msg_id>;" do
      t = Mail::InReplyToField.new( '<20010307181747.A1531@socrate>;' )
      t.name.should eq 'In-Reply-To'
      t.message_ids.should eq ['<20010307181747.A1531@socrate>']
    end

    it 'should be able to parse <"urn:correios:msg:2011071303483114f523ef89e040878bca2e451a999448"@1310528911569.rte-svc-na-5006.iad5.amazon.com>' do
      m = Mail::InReplyToField.new( '<"urn:correios:msg:2011071303483114f523ef89e040878bca2e451a999448"@1310528911569.rte-svc-na-5006.iad5.amazon.com>' )
      m.message_ids.should eq ['<"urn:correios:msg:2011071303483114f523ef89e040878bca2e451a999448"@1310528911569.rte-svc-na-5006.iad5.amazon.com>']
    end
  end
end
