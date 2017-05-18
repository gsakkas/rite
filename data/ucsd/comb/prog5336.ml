
let rec mulByDigit i l =
  if i >= 0 then List.rev (mulByDigit (i - 1) l) else mulByDigit l l;;

let _ = mulByDigit 9 [9; 9; 9; 9];;
