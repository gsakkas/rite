
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> append_new listReverse tail [head];;
