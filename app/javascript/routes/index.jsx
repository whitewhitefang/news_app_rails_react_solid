import React from "react";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Homepage from "../components/Homepage";
import Articles from "../components/Articles";
import Article from "../components/Article";
import NavBar from "../components/NavBar";
import Error404 from "../components/Error404";

export default (
  <Router>    
    <NavBar />
    <Routes>
      <Route path="/" element={<Homepage />} />
        <Route path="/articles" element={<Articles />} />
        <Route path="/articles/:id" element={<Article />} />
        <Route path="/404" element={<Error404 />} />
        <Route path="/*" element={<Navigate to="/404" />} />
    </Routes>
  </Router>
);
