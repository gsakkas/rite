
let rec mulByDigit i l = let h::t = List.rev l in (mulByDigit h) * i;;
