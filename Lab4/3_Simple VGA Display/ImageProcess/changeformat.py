def replace_0b_with_0b_prime(input_file, output_file):
    try:
        # Read the content of the input file
        with open(input_file, 'r', encoding='utf-8') as file:
            content = file.read()

        # Replace all occurrences of '0b' with '0' + "'" + 'b'
        modified_content = content.replace("0b", "8'b")

        # Write the modified content to the output file
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write(modified_content)

        print(f"The file '{output_file}' has been successfully updated.")
    except FileNotFoundError:
        print(f"The file '{input_file}' does not exist.")
    except Exception as e:
        print(f"An error occurred: {e}")

# Example usage:
input_filename = "MUSTsmall.txt"  # The name of the file you want to process
output_filename = "output.txt"  # The name of the file to save the modified content

replace_0b_with_0b_prime(input_filename, output_filename)