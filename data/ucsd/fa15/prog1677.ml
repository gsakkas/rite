
let rec build (rand,depth) = match depth with | 0 -> rand (0, 1) | _ -> rand;;
