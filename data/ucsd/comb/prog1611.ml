
let rec append xs1 xs2 =
  match xs1 with
  | [] -> xs2
  | hd::tl -> hd :: ((append tl xs2) append [1] [2]);;
