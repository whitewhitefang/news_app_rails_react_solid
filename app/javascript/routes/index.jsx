import React from "react";
import { BrowserRouter as Router, Routes, Route, BrowserRouter } from "react-router-dom";
import Homepage from "../components/Homepage";
import Articles from "../components/Articles";

export default (
  <Router>    
    <Routes>
      <Route path="/" element={<Homepage />} />
      <Route path="/articles" element={<Articles />} />
    </Routes>
  </Router>
);
