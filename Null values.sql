
SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT * 
FROM layoffs_staging2
WHERE company = 'Bally\'s Interactive';

SELECT * FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
	AND t1.location = t2.location
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL AND t2.industry != '');

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
	AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND (t2.industry IS NOT NULL AND t2.industry != '');
