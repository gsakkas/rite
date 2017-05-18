
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

let _ =
  sqsum [1; 2; 3] List.fold_left (fun sum  -> fun a  -> sum + (a * a)) 0
    [2; 5; 3; 1];;
