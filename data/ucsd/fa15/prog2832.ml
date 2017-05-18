
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ ([hd] :: i);;

let _ = mulByDigit 9 [9; 9; 9; 9];;
