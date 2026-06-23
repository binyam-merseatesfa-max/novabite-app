import React from 'react';

const APP_VERSION = "v1.1.0"; 

function App() {
  return (
    <div style={{ fontFamily: 'Arial, sans-serif', padding: '20px', textAlign: 'center', backgroundColor: '#f4f4f9', minHeight: '100vh', color: '#333' }}>
      <header style={{ background: '#ff5a5f', color: 'white', padding: '20px', borderRadius: '8px' }}>
        <h1>NovaBite – Restaurantbewertungen</h1>
        <p>Generiert via Vite & bereit für die Cloud!</p>
      </header>
      
      <main style={{ maxWidth: '600px', margin: '30px auto', background: 'white', padding: '20px', borderRadius: '8px', boxShadow: '0 4px 6px rgba(0,0,0,0.1)' }}>
        <h2 style={{ color: '#222' }}>Restaurant-Übersicht</h2>
        <ul style={{ listStyle: 'none', padding: 0, textAlign: 'left' }}>
          <li style={{ padding: '10px', borderBottom: '1px solid #eee' }}>⭐ 4.5 - Luigi's Pizzeria (Italienisch)</li>
          <li style={{ padding: '10px', borderBottom: '1px solid #eee' }}>⭐ 4.8 - Burger Heaven (Amerikanisch)</li>
        </ul>
        
        {/* Kleiner Info-Kasten, damit man sieht, in welcher Umgebung man sich befindet */}
        <div style={{ marginTop: '20px', padding: '10px', backgroundColor: '#eef2f7', borderRadius: '4px', fontSize: '0.9em' }}>
          <strong>Infrastruktur-Status:</strong> Pipeline-ready &amp; Blue/Green kompatibel.
        </div>
      </main>

      <footer style={{ marginTop: '50px', color: '#777' }}>
        <p>Status: Live | Version: <strong style={{ color: '#ff5a5f', fontSize: '1.2em' }}>{APP_VERSION}</strong></p>
      </footer>
    </div>
  );
}

export default App;