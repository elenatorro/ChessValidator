class Piece
	def initialize(id)
		
	end
	def validate(pos1, pos2)
		if (pos1 == nil or pos2 == nil) or ((1..8).include?(pos2[1]) or ('a'..'b').include?(pos2[1])) then return "ILLEGAL" end
		return "LEGAL"
	#	if  then return "ILLEGAL" end
	end
end


class Pawn < Piece
	def validate(pos1, pos2)
		if super(pos1,pos2) == "LEGAL" 
			unless pos1[1] == '1' or pos2[1] == '1'
				if ((pos1[1].to_i+1 == pos2[1].to_i) and (pos1[0] == pos2[0])) then return "LEGAL" end
				if ((pos1[1] == '2') and (pos2[1] == '4') and (pos1[0] == pos2[0])) then return "LEGAL" end
				return "ILLEGAL"
			end ##unless
		end ##if super
		return "ILLEGAL"
	end
end


class King < Piece
	def validate(pos1,pos2)
		if super(pos1,pos2) == "LEGAL"
			if ((pos1[1].to_i - pos2[1].to_i).abs <= 1) and ((pos1[0].ord - pos2[0].ord).abs <= 1) then return "LEGAL" end
			if ((pos1[1].to_i.next == pos2[1].to_i) or (pos1[1].to_i.next == pos2[1].to_i)) then return "LEGAL" end
			return "ILLEGAL"
		end ##if super
		return "ILLEGAL"
	end
end

