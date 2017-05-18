
let rec listReverse n =
  match n with | [] -> [] | hd::tl -> [listReverse tl; hd];;
