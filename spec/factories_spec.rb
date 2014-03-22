FactoryGirl.factories.map(&:name).each do |factory_name|
  unless factory_name =~ /^invalid_/
    describe "The #{factory_name} factory" do
       it 'is valid' do
        FactoryGirl.build(factory_name).should be_valid
       end
    end
  end
end