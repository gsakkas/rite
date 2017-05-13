
let rec build (rand,depth) =
  match rand depth with | (r,0) -> build (r, 0) | (r,d) -> (r, (d - 1));;
