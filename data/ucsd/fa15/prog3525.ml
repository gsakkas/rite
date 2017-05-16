
let rec mulByDigit i l = if i > 0 then l + (mulByDigit (i - 1) l) else l;;

let _ = mulByDigit 9 [9; 9; 9; 9];;
