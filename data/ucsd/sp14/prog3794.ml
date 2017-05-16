
let rec listReverse l =
  let rec reverseHelper revd =
    match revd with | [] -> [] | h::t -> (reverseHelper t h) :: revd in
  reverseHelper [] l;;
