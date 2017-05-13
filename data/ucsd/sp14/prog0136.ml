
let rec sumList xs = match sumList with | h::t -> h + (sumList t);;
