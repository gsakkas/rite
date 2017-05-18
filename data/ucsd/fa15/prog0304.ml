
let rec sumList xs = function | [] -> 0 | xf::xb -> xf + (sumList xb);;
