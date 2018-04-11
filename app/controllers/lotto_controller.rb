class LottoController < ApplicationController
  
    def index 
    end
    
    def show
        require 'open-uri'
        require 'json' 

        @page = open('http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=801')
        @page = @page.read
        
        @page_info = JSON.parse(@page)
        
        @draw_numbers = []
        
        @page_info.each do |k,v|
         @draw_numbers << v if k.include? ('drwtNo')
        end
        
        @draw_numbers.sort!
        
        @bonus_number = []
        @page_info.each do |k,v|
         @bonus_number << v if k.include? ('bnusNo')
        end
        
        @lotto = (1..45).to_a.sample(6).sort
        
        @match_numbers = @lotto & @draw_numbers
        
        @match_count = @match_numbers.count
        
        if @match_count == 6 
            @result = '??????진짜 가자 이건;;;당장 편의점 달려가즈아..... '
        elsif (@match_count == 5) && (@lotto.include?(@bonus_number))
            @result = '1등이 보인다!!!! 가즈아아ㅏㅏㅏㅏ!!'
        elsif @match_count == 5
            @result = '3등으로 부족하다!!!감칠맛 난다! 가즈아아ㅏㅏㅏ!!'
        elsif @match_count == 4
            @result = '4등은 받으니만 못하다!!!가즈아아아ㅏㅏㅏ!!!'
        elsif @match_count == 3
            @result = '5등!! 본전치기 했으니 다시 가즈아ㅏㅏㅏ!!!!'    
        else
            @result = '꼴찌??질 수 없다~한번 더 가즈아ㅏㅏㅏㅏ!!!'
        end
   
    end
end
