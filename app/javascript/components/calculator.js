const mifflinStJeorMale = (weight, height, age) => {
  // BMR = 10W + 6.25H - 5A + 5
  // weight in kg, height in cm
  return (10 * weight) + (6.25 * height) - (5 * age) + 5
}

const mifflinStJeorFemale = (weight, height, age) => {
  // BMR = 10W + 6.25H - 5A - 161
  return (10 * weight) + (6.25 * height) - (5 * age) - 161
}

const convertImpToMetWeight = (weight) => {
  return weight * 0.453592;
}

const convertImpToMetHeight = (feet, inches) => {
  return ((feet * 12) + inches) * 2.54;
}

const calcCalories = () => {
  const inputs = getInputs();
  const gender = document.querySelector('input[name=genderOptions]:checked').value;
  const display = document.getElementById('calories');
  const weightLoss = document.getElementById('one-pound');

  if(gender) {
    let bmr = 0;
    if(gender === 'male'){
      bmr = Math.round(mifflinStJeorMale(inputs.weight, inputs.height, inputs.age), 2);
    } else if(gender === 'female') {
      bmr = Math.round(mifflinStJeorFemale(inputs.weight, inputs.height, inputs.age), 2);
    } else {
      display.textContent = 'Please enter all info';
    }
    display.textContent = `BMR: ${bmr} calories/day`;
    display.classList.add('btn');
    weightLoss.textContent = `1-lb/week Weight Loss: ${bmr - 500} calories/day`;
    weightLoss.classList.add('btn');
  }
}

const getInputs = () => {
  const age = document.getElementById('age').value;
  const imperial = document.getElementById('nav-imperial').classList.contains('active');
  let weight = 0;
  let height = 0;

  if(imperial) {
    const impWeight = parseFloat(document.getElementById('imp-weight').value);
    const feet = parseFloat(document.getElementById('feet').value);
    const inches = parseFloat(document.getElementById('inches').value) || 0;
    weight = convertImpToMetWeight(impWeight);
    height = convertImpToMetHeight(feet, inches);
  } else {
    const metWeight = parseFloat(document.getElementById('met-weight').value);
    const height = parseFloat(document.getElementById('met-height').value);
    weight = metWeight;
    height = height;
  }

  const inputs = {
    age: age,
    weight: weight,
    height: height
  }

  return inputs;
}

export { calcCalories };
