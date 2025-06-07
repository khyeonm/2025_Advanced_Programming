// TableauEmbed.js

import React from 'react';

const TableauEmbed = () => {
  return (
  <div style={{ width: '100%', maxWidth: '1400px', margin: '0 auto' }}>
    <iframe
      src="https://public.tableau.com/views/_17492732225060/1?:?:embed=yes&:showVizHome=no"
      style={{ width: '100%', height: '800px', border: 'none' }}
      allowFullScreen
      title="Tableau 워드클라우드"
    ></iframe>
</div>  
  );
};

export default TableauEmbed;
