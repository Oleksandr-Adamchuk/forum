requir 'rails_helper'


describe Category do
    it 'is invalid without title' do
    category = Category.new
    
    expect(category).to be_invalid
end
end

# let category"-> {CAtegoty.new}
# тепер обект буде у всіх тестав


let category: -> {FactoryGirl}