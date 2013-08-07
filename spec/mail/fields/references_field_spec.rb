# encoding: utf-8
require 'spec_helper'
# 
#    The "References:" field will contain the contents of the parent's
#    "References:" field (if any) followed by the contents of the parent's
#    "Message-ID:" field (if any).  If the parent message does not contain
#    a "References:" field but does have an "In-Reply-To:" field
#    containing a single message identifier, then the "References:" field
#    will contain the contents of the parent's "In-Reply-To:" field
#    followed by the contents of the parent's "Message-ID:" field (if
#    any).  If the parent has none of the "References:", "In-Reply-To:",
#    or "Message-ID:" fields, then the new message will have no
#    "References:" field.

describe Mail::ReferencesField do

  it "should initialize" do
    doing { Mail::ReferencesField.new("<1234@test.lindsaar.net>") }.should_not raise_error
  end

  it "should accept a string with the field name" do
    t = Mail::ReferencesField.new('References: <1234@test.lindsaar.net>')
    t.name.should eq 'References'
    t.value.should eq '<1234@test.lindsaar.net>'
    t.message_id.should eq '<1234@test.lindsaar.net>'
  end
  
  it "should accept a string without the field name" do
    t = Mail::ReferencesField.new('<1234@test.lindsaar.net>')
    t.name.should eq 'References'
    t.value.should eq '<1234@test.lindsaar.net>'
    t.message_id.should eq '<1234@test.lindsaar.net>'
  end

  it "should accept multiple message ids" do
    t = Mail::ReferencesField.new('<1234@test.lindsaar.net> <5678@test.lindsaar.net>')
    t.name.should eq 'References'
    t.value.should eq '<1234@test.lindsaar.net> <5678@test.lindsaar.net>'
    t.message_id.should eq '<1234@test.lindsaar.net>'
    t.message_ids.should eq ['<1234@test.lindsaar.net>', '<5678@test.lindsaar.net>']
    t.to_s.should eq '<1234@test.lindsaar.net> <5678@test.lindsaar.net>'
  end

  it "should accept an array of message ids" do
    t = Mail::ReferencesField.new(['<1234@test.lindsaar.net>', '<5678@test.lindsaar.net>'])
    t.encoded.should eq "References: <1234@test.lindsaar.net>\r\n <5678@test.lindsaar.net>\r\n"
  end

  it "should accept no message ids" do
    t = Mail::ReferencesField.new('')
    t.name.should eq 'References'
    t.decoded.should eq nil
  end

  it "should output lines shorter than 998 chars" do
    k = Mail::ReferencesField.new('<Kohciuku@apholoVu.com> <foovohPu@Thegahsh.com> <UuseZeow@oocieBie.com> <UchaeKoo@eeJoukie.com> <ieKahque@ieGoochu.com> <aZaXaeva@ungaiGai.com> <sheiraiK@ookaiSha.com> <weijooPi@ahfuRaeh.com> <FiruJeur@weiphohP.com> <cuadoiQu@aiZuuqua.com> <YohGieVe@Reacepae.com> <Ieyechum@ephooGho.com> <uGhievoo@vusaeciM.com> <ouhieTha@leizaeTi.com> <ohgohGhu@jieNgooh.com> <ahNookah@oChiecoo.com> <taeWieTu@iuwiLooZ.com> <Kohraiji@AizohGoa.com> <hiQuaegh@eeluThii.com> <Uunaesoh@UogheeCh.com> <JeQuahMa@Thahchoh.com> <aaxohJoh@ahfaeCho.com> <Pahneehu@eehooChi.com> <angeoKah@Wahsaeme.com> <ietovoaV@muewaeZi.com> <aebiuZur@oteeYaiF.com> <pheiXahw@Muquahba.com> <aNgiaPha@bohliNge.com> <Eikawohf@IevaiQuu.com> <gihaeduZ@Raighiey.com> <Theequoh@hoamaeSa.com> <VeiVooyi@aimuQuoo.com> <ahGoocie@BohpheVi.com> <roivahPa@uPhoghai.com> <gioZohli@Gaochoow.com> <eireLair@phaevieR.com> <TahthaeC@oolaiBei.com> <phuYeika@leiKauPh.com> <BieYenoh@Xaebaalo.com> <xohvaeWa@ahghaeRe.com> <thoQuohV@Ubooheay.com> <pheeWohV@feicaeNg.com>')
    lines = k.encoded.split("\r\n\s")
    lines.each { |line| line.length.should < 998 }
  end

  it "should handle comma-separated values" do
    t = Mail::ReferencesField.new('<1234@test.lindsaar.net>, <5678@test.lindsaar.net>')
    t.name.should eq 'References'
    t.value.should eq '<1234@test.lindsaar.net>, <5678@test.lindsaar.net>'
    t.message_id.should eq '<1234@test.lindsaar.net>'
    t.message_ids.should eq ['<1234@test.lindsaar.net>', '<5678@test.lindsaar.net>']
    t.to_s.should eq '<1234@test.lindsaar.net> <5678@test.lindsaar.net>'
  end

  it 'should be able to parse |2a26f8f146e27159@domain.com@domain.com, 2a26f8f146e27159@domain.com@domain.com|' do
    m = Mail::ReferencesField.new( '2a26f8f146e27159@domain.com@domain.com, 4769770500E92399@n064.sc1.he.tucows.com' )
    m.message_ids.should eq [ '2a26f8f146e27159@domain.com@domain.com', '4769770500E92399@n064.sc1.he.tucows.com' ]
  end

  it 'should be able to parse |2a26f8f146e27159@domain.com@domain.com 2a26f8f146e27159@domain.com@domain.com|' do
    m = Mail::ReferencesField.new( '2a26f8f146e27159@domain.com@domain.com 4769770500E92399@n064.sc1.he.tucows.com' )
    m.message_ids.should eq [ '2a26f8f146e27159@domain.com@domain.com', '4769770500E92399@n064.sc1.he.tucows.com' ]
  end

  describe 'handles references from the wild' do
    it 'should handle lots of commas' do
      m = Mail::ReferencesField.new( '<DUB121-W44A050451F179BBF0AEBDDD5500@phx.gbl>,<DUB121-W71A97FF6FB7F281C04AAED5470@phx.gbl>,<DUB121-W39FE455D3917A8BAF4ECBAD5460@phx.gbl>,<DUB121-W482D4E62151E5502BD9D05D54B0@phx.gbl>,<DUB121-W56268AEABC9945A01E731D54B0@phx.gbl>,<DUB121-W40A3983CD6ADA65DA68384D54B0@phx.gbl>,<DUB121-W369477F468A4070C7DFDA3D54B0@phx.gbl>,<DUB121-W11CEA863A616C53B5ADF74D54B0@phx.gbl>,<DUB121-W25E077E5857EAB607ABAEBD54B0@phx.gbl>,<DUB121-W11A85D8FB12F1AAFF1634D54C0@phx.gbl>,<DUB121-W41ACC7D281F4BF3BED1839D5330@phx.gbl>,<DUB121-W19E0480A4333A33474E00CD5330@phx.gbl>,<DUB121-W167B4E48F0782BCB59672CD5330@phx.gbl>,<DUB121-W143CF2FDD1FDB545918F7D5330@phx.gbl>,<DUB121-W26988DC0EB8E0F277D43EDD5320@phx.gbl>,<DUB121-W41CF98B01BF527F77A9F6FD5340@phx.gbl>,<DUB121-W4341E35A506D10BFED075ED5340@phx.gbl>,<DUB121-W457967B610B41C093A997CD53B0@phx.gbl>,<DUB121-W130791C2CB989339D1F74DD53A0@phx.gbl>,<DUB121-W16452379BCD7E276624D23D53A0@phx.gbl>,<DUB121-W283E1010A333608989E1F8D53A0@phx.gbl>,<DUB121-W46497A549F499C62C8E915D539 ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,0@phx.gbl>,<DUB121-W215981900995FD08624319D5280@phx.gbl>,<DUB121-W3862E364C2CCE9F36F6D20D5280@phx.gbl>,<DUB121-W480E7E51351DBD86E03329D5280@phx.gbl>,<DUB121-W234969109B8E5B042440CBD5280@phx.gbl>,<DUB121-W40B19F377C5C461DBFF207D5280@phx.gbl>,<DUB121-W110D768412305EEAF7C741D5280@phx. gbl>,<DUB121-W47602A6F49FD901BE508F2D5280@phx.gbl>,<DUB121-W6BD84765C9AA4100F94CCD5280@phx.gbl>,<DUB121-W24A6EC9DBEE256115E611D5280@phx.gbl>,<DUB121-W6CDD26DE8AF063E45C89CD5280@phx.gbl>,<DUB121-W36407AA4F974154F55CD31D51F0@phx.gbl>,<DUB121-W2452EC83B9A80B74213405D5000@phx.gbl>,<DUB121-W286BA716E80764B64AEB85D5070@phx.gbl>' )
      m.message_ids.should eq ["<DUB121-W44A050451F179BBF0AEBDDD5500@phx.gbl>", "<DUB121-W71A97FF6FB7F281C04AAED5470@phx.gbl>", "<DUB121-W39FE455D3917A8BAF4ECBAD5460@phx.gbl>", "<DUB121-W482D4E62151E5502BD9D05D54B0@phx.gbl>", "<DUB121-W56268AEABC9945A01E731D54B0@phx.gbl>", "<DUB121-W40A3983CD6ADA65DA68384D54B0@phx.gbl>", "<DUB121-W369477F468A4070C7DFDA3D54B0@phx.gbl>", "<DUB121-W11CEA863A616C53B5ADF74D54B0@phx.gbl>", "<DUB121-W25E077E5857EAB607ABAEBD54B0@phx.gbl>", "<DUB121-W11A85D8FB12F1AAFF1634D54C0@phx.gbl>", "<DUB121-W41ACC7D281F4BF3BED1839D5330@phx.gbl>", "<DUB121-W19E0480A4333A33474E00CD5330@phx.gbl>", "<DUB121-W167B4E48F0782BCB59672CD5330@phx.gbl>", "<DUB121-W143CF2FDD1FDB545918F7D5330@phx.gbl>", "<DUB121-W26988DC0EB8E0F277D43EDD5320@phx.gbl>", "<DUB121-W41CF98B01BF527F77A9F6FD5340@phx.gbl>", "<DUB121-W4341E35A506D10BFED075ED5340@phx.gbl>", "<DUB121-W457967B610B41C093A997CD53B0@phx.gbl>", "<DUB121-W130791C2CB989339D1F74DD53A0@phx.gbl>", "<DUB121-W16452379BCD7E276624D23D53A0@phx.gbl>", "<DUB121-W283E1010A333608989E1F8D53A0@phx.gbl>", "<DUB121-W46497A549F499C62C8E915D539 ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,0@phx.gbl>", "<DUB121-W215981900995FD08624319D5280@phx.gbl>", "<DUB121-W3862E364C2CCE9F36F6D20D5280@phx.gbl>", "<DUB121-W480E7E51351DBD86E03329D5280@phx.gbl>", "<DUB121-W234969109B8E5B042440CBD5280@phx.gbl>", "<DUB121-W40B19F377C5C461DBFF207D5280@phx.gbl>", "<DUB121-W110D768412305EEAF7C741D5280@phx. gbl>", "<DUB121-W47602A6F49FD901BE508F2D5280@phx.gbl>", "<DUB121-W6BD84765C9AA4100F94CCD5280@phx.gbl>", "<DUB121-W24A6EC9DBEE256115E611D5280@phx.gbl>", "<DUB121-W6CDD26DE8AF063E45C89CD5280@phx.gbl>", "<DUB121-W36407AA4F974154F55CD31D51F0@phx.gbl>", "<DUB121-W2452EC83B9A80B74213405D5000@phx.gbl>", "<DUB121-W286BA716E80764B64AEB85D5070@phx.gbl>"]
    end
  end

end
