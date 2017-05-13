
let rec append l1 l2 =
  let rec helper xs1 xs2 result =
    match xs1 with | [] -> result | hd::tl -> helper tl xs2 (hd :: result) in
  (helper l1 l2 []) append [1] [2];;
