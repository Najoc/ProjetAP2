print_endline("Fetching Slogram...");;
let slogram01 = "wordlists/slogram01.txt";;
let slogram02 = "wordlists/slogram02.txt";;
let slogram_with_duplicates = Func.concatenate_files slogram01 slogram02;;
let slogram = Func.remove_duplicates slogram_with_duplicates;;
print_endline("Slogram ready !");;

print_endline("Fetching tetedamis...");;
let tetedamis01 = "wordlists/tetedamis01.txt";;
let tetedamis02 = "wordlists/tetedamis02.txt";;
let tetedamis_with_duplicates = Func.concatenate_files tetedamis01 tetedamis02;;
let tetedamis = Func.remove_duplicates tetedamis_with_duplicates;;
print_endline("Tetedamis ready !");;

print_endline("Fetching depensetout...");;
let depensetout01 = "wordlists/depensetout01.txt";;
let depensetout02 = "wordlists/depensetout02.txt";;
let depensetout_with_duplicates = Func.concatenate_files depensetout01 depensetout02;;
let depensetout_unhashed = Func.remove_duplicates depensetout_with_duplicates;;
let depensetout = Func.hash_every_password(depensetout_unhashed);;
print_endline("depensetout ready !");;

print_endline("Analyzing Slogram hashed password...");;
let slogram_depensetout = Func.concatenate_lists slogram depensetout;;
let slogram_depensetout_duplicates = Func.find_duplicates slogram_depensetout;;
print_endline("Extracting clear password from slogram...");;
let slogram_clear = Func.extract_clear_password slogram_depensetout_duplicates depensetout_unhashed;;
print_endline("Done !");;

print_endline("Analyzing tetedamis hashed password...");;
let tetedamis_depensetout = Func.concatenate_lists tetedamis depensetout;;
let tetedamis_depensetout_duplicates = Func.find_duplicates tetedamis_depensetout;;
print_endline("Extracting clear password from tetedamis...");;
let tetedamis_clear = Func.extract_clear_password tetedamis_depensetout_duplicates depensetout_unhashed;;
print_endline("Done !");;

print_endline("Combining Results...");;
let slogram_answer = Func.create_triples "Slogram" slogram_clear;;
let tetedamis_answer = Func.create_triples "Tetedamis" tetedamis_clear;;
let answers = Func.concatenate_lists slogram_answer tetedamis_answer;;
print_endline("writing the results in results.txt...");;
Func.write_to_file "results.txt" answers;;

print_endline("Done and done !");;
