
let rec listReverse l =
  let rec reverseHelper revd =
    match l with | [] -> [] | h::t -> listReverse t (h :: revd) in
  reverseHelper [];;
