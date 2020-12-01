require_relative '../config/environment.rb'

describe CLI do
    cli = CLI.new
    
    it "has a #valid_city? method" do
        expect(cli.valid_city?(nil)).to equal(nil)
    end
end