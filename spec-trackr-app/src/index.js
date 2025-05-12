import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import ComSp from "./com_sp";
import "./index.css";
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <ComSp />
  </React.StrictMode>
);

reportWebVitals();
