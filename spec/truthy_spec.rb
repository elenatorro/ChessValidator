require 'rspec'
require_relative "../Validator.rb"


describe "Testing white pawn's basic movements" do
	before :each do
		@piece = Pawn.new('wp')
	end

	it "Empty movements" do	
		expect(@piece.validate(nil,nil)).to eq("ILLEGAL")
	end

	it "Move one pawn from the first line" do
		expect(@piece.validate('a1','a2')).to eq("ILLEGAL")
	end

	it "Move one pown to the first line" do
		expect(@piece.validate('a2','a1')).to eq("ILLEGAL")
	end

	it "Move one pawn horizontally" do
		expect(@piece.validate('a2','b2')).to eq("ILLEGAL")
	end

	it "A pawn can not move back" do
		expect(@piece.validate('a3','a2')).to eq("ILLEGAL")
	end

	it "A pawn moves twice in the first movement" do
		expect(@piece.validate('a2','a4')).to eq("LEGAL")
	end

	it "A pawn moves more than one position" do
		expect(@piece.validate('a3','a5')).to eq("ILLEGAL")
	end

	it "A pown tries to go out of the board by number" do
		expect(@piece.validate('a3','a9')).to eq("ILLEGAL")
	end

	it "A pown tries to go out of the board by letter" do
		expect(@piece.validate('a3','z5')).to eq("ILLEGAL")
	end
end

describe "Testing white king's basic movements" do
	before :each do
		@king = King.new('wk')
	end

	it "A King can not move more than two cells horizontally" do
		expect(@king.validate('d2','f2')).to eq("ILLEGAL")
	end

	it "A King can not move more than two cells vertically" do
		expect(@king.validate('f2','f4')).to eq("ILLEGAL")
	end

	it "A King can not move more than two cells diagonal positive" do
		expect(@king.validate('d2','f8')).to eq("ILLEGAL")
	end
	it "A King can not move more than two cells diagonal negative" do
		expect(@king.validate('h6','c2')).to eq("ILLEGAL")
	end

end



