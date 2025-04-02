// app.js
document.addEventListener('DOMContentLoaded', function() {
    fetchSkills();
  });
  
  async function fetchSkills() {
    try {
      // Fetch skills from your Node.js backend
      const response = await fetch('http://localhost:5000/api/skills');
      
      if (!response.ok) {
        throw new Error('Failed to fetch skills');
      }
      
      const skills = await response.json();
      displaySkills(skills);
    } catch (error) {
      console.error("Error:", error);
      // Fallback in case API fails
      document.getElementById('skills-list').innerHTML = 
        '<p>Unable to load skills. Please try again later.</p>';
    }
  }
  
  function displaySkills(skills) {
    const container = document.getElementById('skills-list');
    
    skills.forEach(skill => {
      const skillElement = document.createElement('div');
      skillElement.className = 'skill-item';
      
      skillElement.innerHTML = `
        <h3>${skill.skill_name}</h3>
        <div class="skill-bar">
          <div class="skill-progress" style="width: ${skill.proficiency}%"></div>
        </div>
        <span>${skill.proficiency}%</span>
      `;
      
      container.appendChild(skillElement);
    });
  }