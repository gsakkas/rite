
let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> append (listReverse tl) hd;;

let _ = listReverse [1; 2; 3; 4];;
