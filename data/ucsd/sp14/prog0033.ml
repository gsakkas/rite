
let join x l = x :: l;;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> join (listReverse tl) hd;;
