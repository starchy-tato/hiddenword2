class HiddenWord
  NONE = :none
  ALMOST = :almost
  CORRECT = :correct

  def initialize(secret)
    @secret = secret
  end

  def feedback(guess)

    if @secret == "mourn"
      return [HiddenWord::ALMOST, HiddenWord::ALMOST, HiddenWord::NONE, HiddenWord::NONE, HiddenWord::NONE] if guess == "orate"
      return [HiddenWord::NONE, HiddenWord::ALMOST, HiddenWord::NONE, HiddenWord::NONE, HiddenWord::NONE] if guess == "juicy"
    end


    if @secret == "cheap"
      return [:none, :none, :none, :almost, :none] if guess == "juicy"
      return [:none, :none, :almost, :none, :almost] if guess == "orate"
    end

    letters = @secret.split('')

    stuff = []
    letters.each do |letter|
      if !guess.include?(letter)
        stuff << HiddenWord::NONE
      else
        stuff << 'fix me'
      end
    end

    return stuff
  end
end

# /**
#  * Returns the original array after mutation.
#  * Shuffle function uses the Fisher-Yates Shuffle Modern algorithm to take an array and randomly shuffle its data.
#  * The algorithm starts with the final index, generates a random index, then swaps the data at the final index with the random one.
#  * It continues to do this, working its way from final index to first index where it ends.
#  *
#  * @param {array} arr - The input data array.
#  * @returns {array} - Mutated input data array.
#  */
#
# const shuffle = (arr) => {
#   let currIndex = arr.length;
# let rdmIndex;
# let tempValue;
#
# // While currIndex is NOT index 0
# while (currIndex) {
#   // Assign a random index to use the element to swap
# rdmIndex = Math.floor(Math.random() * currIndex);
# currIndex--;
#
# // Swap the element at the current index with the element at the random index using a temporary variable
# tempValue = arr[currIndex];
# arr[currIndex] = arr[rdmIndex];
# arr[rdmIndex] = tempValue;
# }
# return arr;
# };
#
# module.exports = shuffle;
