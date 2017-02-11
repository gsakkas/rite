
let rec append xs1 xs2 =
  let rec helper xs1 xs2 result =
    match xs1 with | [] -> result | hd::tl -> helper tl xs2 (hd :: result) in
  (helper xs1 xs2 []) append [1] [2];;
