// firebase.js
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.2/firebase-app.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/10.12.2/firebase-auth.js";

// Configuración de Firebase
const firebaseConfig = {
  apiKey: "AIzaSyB-jb3mybgixNPt4DbjveAamPLXPjfdUnw",
  authDomain: "castnet-8a81c.firebaseapp.com",
  projectId: "castnet-8a81c",
  storageBucket: "castnet-8a81c.appspot.com",
  messagingSenderId: "685260060310",
  appId: "1:685260060310:web:e82e1193ec898d489474b7",
  measurementId: "G-FFZPFNK4MW"
};

// Inicializar Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);

export { auth };
