
let rec listReverse l = failwith "TBD";;

let listReverse l =
  let rec reverseHelper revd =
    match revd with | [] -> [] | h::t -> listReverse t (h :: revd) in
  reverseHelper [] l;;
