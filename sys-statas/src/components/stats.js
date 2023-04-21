import React, { useState, useEffect } from 'react';

import axios from 'axios';



function Stats() {

  const [cpuUsage, setCpuUsage] = useState(0);

  const [memUsage, setMemUsage] = useState(0);



  useEffect(() => {

    const intervalId = setInterval(() => {

      axios.get('/stats').then(response => {

        setCpuUsage(response.data.cpu_usage);

        setMemUsage(response.data.mem_usage);

      });

    }, 1000);



    return () => clearInterval(intervalId);

  }, []);



  return (

    <div>

      <p>CPU Usage: {cpuUsage}%</p>

      <p>Memory Usage: {memUsage}%</p>

    </div>

  );

}



export default Stats;


