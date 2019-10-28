const mifflinStJeorMale = (weight, height, age) => {
  // BMR = 10W + 6.25H - 5A + 5
  // weight in kg, height in cm
  return (10 * weight) + (6.25 * height) - (5 * age) + 5
}

const mifflinStJeorFemale = (weight, height, age) => {
  // BMR = 10W + 6.25H - 5A - 161
  return (10 * weight) + (6.25 * height) - (5 * age) - 161
}

const convertImpToMet = (weight, feet, inches) => {
  let results = {};
  results['weight'] = weight / 0.453592;
  results['height'] = ((feet * 12) + inches) * 2.54;

  return results;
}
