
let rec build (rand,depth) = match rand with | _ -> rand (0, 1);;

let _ = build (10, 0);;
