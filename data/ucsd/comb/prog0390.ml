
let foo xs = match xs with | [] -> [] | h::t -> h;;

let _ = foo [(fun x  -> x + 1); (fun y  -> y - 1)];;
