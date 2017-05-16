
let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> m;;

let _ = mulByDigit 9 [9; 9; 9; 9];;
