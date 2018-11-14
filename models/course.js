'use strict';

module.exports = (sequelize, DataTypes) => {

  var Course = sequelize.define('Course', {
    title: DataTypes.STRING,
    price:DataTypes.FLOAT,
    duration:DataTypes.STRING,
    subject:DataTypes.STRING,
    start_date:DataTypes.DATEONLY,
    desr: DataTypes.TEXT,
    pimg:DataTypes.STRING,
  },
  {
    tableName:'courses',
    timestamps: true,
  });

  return Course;

};
