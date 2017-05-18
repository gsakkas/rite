
let rec listReverse n =
  let rec concat x y = x :: y in
  match n with | [] -> [] | hd::tl -> concat (listReverse tl) [hd];;
