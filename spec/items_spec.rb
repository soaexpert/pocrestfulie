require 'spec_helper'

describe ItemsController do
  
  context "when creating an item" do

    it "should keep its values" do
      p = Restfulie.at('http://localhost:3000/items').as("application/xml").post("<item><name>Agile Training</name><price>500</price></item>")
      p.item.name.should == "Agile Training"
      p.item.price.should == 500
    end

  end

  context "when retrieving data" do
    it "should retrieve one single element" do
      p = Restfulie.at('http://localhost:3000/items/1').get
      p.item.name.should == "Rest in practice"
      p.item.price.should == 400
    end
    
    it "should retrieve an array" do
      p = Restfulie.at('http://localhost:3000/items').get
      p.items.item[0].name.should == "Rest in practice"
      p.items.item[0].price.should == "400.0"
    end
    
  end
  
end

